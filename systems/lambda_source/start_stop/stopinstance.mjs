import { EC2Client, StopInstancesCommand, StartInstancesCommand } from "@aws-sdk/client-ec2";
import { RDSClient, DescribeDBInstancesCommand, StartDBInstanceCommand, StopDBInstanceCommand } from "@aws-sdk/client-rds";

// Main : Invoked by AWS Lambda
export const handler = async (event, context) => {
    const resourceType = event.resourceType; // 起動または停止するリソースのタイプを指定 ("ec2"または"rds")
    const action = event.action; // 起動または停止のアクションを指定 ("start"または"stop")
    const resourceIds = event.resourceIds; // リソースIDの配列を指定
    const resourceRegion = event.resourceRegion; // 対象インスタンスが存在するリージョンを指定

// Validation Check
    if(!((action === "start") || (action === "stop"))){
        console.error(`statusCode: 400, body: "Invalid action type specified"`);
        return { statusCode: 400, body: "Invalid action type specified" };
    }

    if (resourceType === "ec2") {
        await manageEC2Instances(action, resourceIds, resourceRegion);
    } else if (resourceType === "rds") {
        await manageRDSInstances(action, resourceIds, resourceRegion);
    } else {
        console.error(`statusCode: 400, body: "Invalid resourceType  specified"`);
        return { statusCode: 400, body: "Invalid resource type specified" };
    }

    return { statusCode: 200, body: `Instances ${action}ed successfully` };
};

// EC2起動, 停止用
async function manageEC2Instances(action, instanceIds, resourceRegion) {
    const ec2Client = new EC2Client({ region: resourceRegion }); // EC2インスタンスのリージョンを指定
    
    const command = action === "start" ? StartInstancesCommand : StopInstancesCommand;
    
    const params = {
        InstanceIds: instanceIds,
    };
    console.log(params);
    
    try {
        await ec2Client.send(new command(params));
        console.log(`EC2 instances ${action}ed successfully`);
    } catch (error) {
        console.error(`Error ${action}ing EC2 instances:`, error);
        throw new Error(`Error ${action}ing EC2 instances`);
    }
}

// RDS管理用
async function manageRDSInstances(action, instanceIds, resourceRegion) {
    
    try {
        const rdsClient = new RDSClient({ region: resourceRegion }); // RDSインスタンスのリージョンを指定
        
        for (const instanceId of instanceIds) {
            // RDSインスタンスの状態を取得
            const instances = await describeDBInstances(rdsClient, instanceId);
            if (instances.length === 0) {
                console.error(`RDS instance ${instanceId} not found`);
                continue;
            }
            
            const instance = instances[0];
            const currentState = instance.DBInstanceStatus;
            
            if (action === "start"){
                if (currentState === "available"){
                    console.log(`RDS instance ${instanceId} is already running. Skipping start.`);
                } else if (currentState === "stopped") {
                    await startDBInstance(rdsClient, instanceId);
                    console.log(`RDS instance ${instanceId} started successfully.`);
                } else {
                    console.error(`Invalid state for RDS instance ${instanceId}: ${currentState}`);
                }
            } else {
                if (currentState === "stopped"){
                    console.log(`RDS instance ${instanceId} is already stopped. Skipping stop.`);
                } else if (currentState === "available") {
                    await stopDBInstance(rdsClient, instanceId);
                    console.log(`RDS instance ${instanceId} stopped successfully.`);
                } else {
                    console.error(`Invalid state for RDS instance ${instanceId}: ${currentState}`);
                }
            }
        }
        
        return { statusCode: 200, body: "Operation completed successfully." };
            
    } catch (error) {
        console.error(`Error ${action}ing RDS instances:`, error);
        throw new Error(`Error ${action}ing RDS instances`);
    }
}

// RDS状態確認用
async function describeDBInstances(rdsClient, instanceId) {
    const command = new DescribeDBInstancesCommand({
        DBInstanceIdentifier: instanceId,
    });
    
    const response = await rdsClient.send(command);
    return response.DBInstances;
}

// RDS起動用
async function startDBInstance(rdsClient, instanceId) {
  const command = new StartDBInstanceCommand({
    DBInstanceIdentifier: instanceId,
  });

  await rdsClient.send(command);
}

// RDS停止用
async function stopDBInstance(rdsClient, instanceId) {
  const command = new StopDBInstanceCommand({
    DBInstanceIdentifier: instanceId,
  });

  await rdsClient.send(command);
}