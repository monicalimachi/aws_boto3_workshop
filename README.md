# aws_boto3_workshop
Workshop for boto3 and aws
- En IAM crear un usuario: user1001
  <img width="899" alt="iam-user-with-key" src="https://github.com/monicalimachi/aws_boto3_workshop/assets/12466501/ca392ee7-febb-48ac-a03c-c6890eacb318">
- Adicionar los permisos (policies) en el usuario para acceder a los recursos utilizando una llave (Key)
  ```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "test0101010100101010",
            "Action": [
                "kms:GenerateDataKey",
                "kms:Decrypt"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:Get*",
                "iam:List*"
            ],
            "Resource": "*"
        }
     ]
  }

  ```
- Adicionar los permisos (policies) para que el usuario tenga acceso a S3:
  ```
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:PutBucketAcl",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::s3-bucket-workshop-1001-pyday/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "*"
        }
    ]
  }
  ```
- Crear un S3 bucket con < Block all public access ON > y adicionarle permisos (policies): 
  ```
    {
    "Version": "2012-10-17",
    "Statement": [
        {  "Principal": "arn:aws:iam::995819606325:user/user1001",
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:ListBucketVersions",
                "s3:PutBucketAcl",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::s3-bucket-workshop-1001-pyday/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": "*"
        }
    ]
  }
  ```

- Instalar y Configurar AWS CLI
  ```
  > aws configure
  > add_key
  > add_password
  > aws configure list
  ```
- Ejecutar un comando con el bucket creado previamente para testear la conexion con AWS:
  ```
  aws s3 ls
  ```
- Clonar el repositorio
- Dentro el repositorio se creara un entorno virtual (virtualenv)
- Instalar y habilitar virtualenv:  https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/
- Una vez habilitado virtualenv. Instalar todos los requerimientos y verificar la lista instalada en el entorno virtual creado:
  ```
  pip install -r requirements.txt
  pip list
  ```
- En el repositorio se encontrara los comandos para comenzar a listar, bajar o subir objetos a S3, modificar el codifo para que se utilice el bucket creado.

