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

### 1. 라벨링 프로젝트 브랜치 생성  
`task_{task name}`과 같은 네이밍으로 새로운 브랜치를 팝니다.  
예를 들면 경고등 인식 라벨링 프로젝트 같은 경우 `task_car_warning`으로 이름 지었습니다.  

### 2. UI 셋업  

프로젝트에 필요한 UI 구성에 많은 시간을 들여서 최적화를 진행할 필요가 있음  
이때 UI Component별 Parameter를 잘 숙지하면 많은 시간을 아끼고 기능을 100% 사용할 수 있음  

- [LS UI Component Doc](https://labelstud.io/tags/image.html)  
- [Playground](https://labelstud.io/playground/)   


### 3. 프로젝트 셋업  

`config.xml` : UI 구성을 담고 있는 화면  
`project_config.json` : 프로젝트 전반의 configuration을 담고 있는 `json`  
`/tools/run.sh` : 위 스크립트를 실행하면 프로젝트 초기화와 함께 서버 실행을 할 수 있음. 다만 `project_config.json`과 내용을 일치시켜준느게 바람직함  

### 4. S3 버킷 권한 설정  

1. S3 IAM User 생성 : S3 storage를 활용하는 경우 LS는 programmatic한 access하기 때문에 IAM을 통해서 S3 access 권한을 가지는 user를 생성해야 함. 이후 `acess_key` 와 `acess_secret`을 저장할 것
2. AWS Cli Configure : LS가 돌아가는 환경 내에서 AWS cli 인증이 되어 있어야 함. 따라서 AWS CLI 설치 후에 `aws configure`를 입력해서 profile을 등록해 놓을 것  
3. S3 버킷 연결 시에는 project owner가 해당 권한을 가지고 있는지 체크할 것. 현재는 root 사용자 이외의 다른 사용자를 s3 owner로 설정하는 것이 불가능해서 root로 설정해놓은 상황  

**S3 관련 에러**  

`SignatureNotMatch` : `acess_key`나 `access_secret`에서 스페이스가 하나 더 들어갔을 수도 있으니 `aws configure`를 해서 api token을 다시 입력하도록  
`403 Forbbiden` : IAM user에 권한이 없어서 그런 걸 수 있음 권한 설정을 다시 할 것  
