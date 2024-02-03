初期構築手順  
1.S3バケットを手動で作成  
2.tfbackendファイルのバケット名を作成したバケット名に変更する  
3.initしてからS3をimportする  
terraform init -reconfigure -backend-config=_pd.tfbackend  
terraform import -var-file=_pd.tfvars module.s3_terraform_main.aws_s3_bucket.this [バケット名]  
4.VPCからapplyする  
terraform plan -var-file=_pd.tfvars -target=module.vpc_main  
terraform apply -var-file=_pd.tfvars -target=module.vpc_main  
  
  
IAMuser_gpgkey作成方法、パスワード復号方法  
#以下の手順を実際にapplyするサーバで実施する。 ・鍵の生成  
01.鍵の生成:gpg --gen-key  
02.キー名とパスワードを入力する。  
・鍵の保存  
01.公開鍵の保存：gpg -o ./terraform.public.gpg --export [鍵の生成で作成したキー名]  
02.秘密鍵の保存：gpg -o ./terraform.private.gpg --export-secret-key [鍵の生成で作成したキー名]  
・公開鍵をBase64エンコードして保存  
01.cat terraform.public.gpg | base64 | tr -d '\n' > terraform.public.gpg.base64  
  
・パスワード復号方法(idとpasswordの一括生成)  
terraform output -json | ruby -rjson -e 'json = JSON.load(ARGF); values = json["username"]["value"]; keys = %w(id encrypted_password); puts [keys, *keys.map{|key| values.map{|value| v = value[1][key].split; key == "encrypted_password" ? v.map{|s| `echo #{s} | base64 -di | gpg -r terraform`.chomp} : v}}.transpose].map{|a| a.join(",")}'  
