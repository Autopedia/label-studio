## Car Warning Detection Project  

## TO-DO  

- [ ] 경고등 종류 추가하기
- [ ] 경고등 이미지 S3 등록하기  
- [ ] 도커 이미지 빌드

## How-to-Run  

```
./tool/run.sh
```  

## Launch New Project  

### 1. 신규 라벨링 프로젝트 설정   
`projects/template_project` 폴더를 복사하여 `task_{task name}`과 같은 네이밍으로 새로운 프로젝트 폴더를 생성합니다.  
이때 신규 프로젝트를 위해 설정해줘야 하는 값은 크게 4가지 입니다.  

- `build.sh` :  
        - `PROJECT_NAME` : 원하는 프로젝트 이름으로 설정합니다.  
        - `PORT` : 포트 번호를 설정합니다.  
- `project_config.json` : 메인 타이틀, 라벨 삭제 허용 여부 등을 추가로 지정할 수 있습니다. 
- `config.xml` : UI 세팅을 담습니다. 로컬 환경에서 먼저 테스트 한 후 복사해 붙여넣으면 편리합니다.  
- `docker-entrypoint.sh` : Label Studio 실행을 위한 arguments가 담겨 있습니다. 상황에 맞게 변경해줍니다. 


### 2. UI 셋업  

프로젝트에 필요한 UI 구성에 많은 시간을 들여서 최적화를 진행할 필요가 있음  
이때 UI Component별 Parameter를 잘 숙지하면 많은 시간을 아끼고 기능을 100% 사용할 수 있음  

- [LS UI Component Doc](https://labelstud.io/tags/image.html)  
- [Playground](https://labelstud.io/playground/)   


### 3. S3 버킷 권한 설정  

1. S3 IAM User 생성 : S3 storage를 활용하는 경우 LS는 programmatic한 access하기 때문에 IAM을 통해서 S3 access 권한을 가지는 user를 생성해야 함. 이후 `acess_key` 와 `acess_secret`을 저장할 것
2. AWS Cli Configure : LS가 돌아가는 환경 내에서 AWS cli 인증이 되어 있어야 함. 따라서 AWS CLI 설치 후에 `aws configure`를 입력해서 profile을 등록해 놓을 것  
3. S3 버킷 연결 시에는 project owner가 해당 권한을 가지고 있는지 체크할 것. 현재는 root 사용자 이외의 다른 사용자를 s3 owner로 설정하는 것이 불가능해서 root로 설정해놓은 상황  

**S3 관련 에러**  

`SignatureNotMatch` : `acess_key`나 `access_secret`에서 스페이스가 하나 더 들어갔을 수도 있으니 `aws configure`를 해서 api token을 다시 입력하도록  
`403 Forbbiden` : IAM user에 권한이 없어서 그런 걸 수 있음 권한 설정을 다시 할 것  


### 4. Run Docker-Compose  

위에서 만든 프로젝트 폴더 위치에서 `./build.sh`를 실행하면 
`temp` 폴더를 생성한 후 `docker-entrypoint.sh`와 `config.xml` 파일을 복사한 후  
`docker-compose up --build -d`로 이미지를 빌드 한 후 백그라운드에서 실행시킵니다.  
정상적으로 실행되었다면 `docer container ls`를 통해서 확인할 수 있습니다. 



## Monitor Container Logs  

실행 중인 특정 프로젝트 컨테이너 로그를 실시간으로 확인하고 싶다면 

`docker container ls` 로 실행 중인 컨테이너의 `ID`를 확보한다.  

이후 

```
docker logs -f <container_id>
```
를 하면 실시간으로 해당 컨테이너에서 발생하는 로그를 확인할 수 있다. 


## Shell Access to Container  

실행 중인 특정 프로젝트 컨테이너에 `shell` 접속을 위해서는 아래와 같이 입력하면 된다. 

```
docker exec -it <container_id> bash
```



## TO-DO  

- [ ] Inject AWS (or GCP) credential info  
- [x] Launch with WSGI server 
- [ ] Nginx Setup for multiple project