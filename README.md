![header](https://capsule-render.vercel.app/api?type=rounded&color=auto&height=300&section=header&text=ElasticSearch_Study&fontSize=70)

## Overview
---

파이썬 클라이언트를 활용한 공공데이터
* Logstash
* ElasticSearch
* Kibana
* Python
* QGIS
* Nginx

<br>

## Getting Started

```
docker-compose up
```

<br>

## Structure


```bash
├── kibana_vfs
│   └── kibana.yml
├── logstash_vfs
│   ├── logstash-spop.conf
│   ├── logstash.yml
│   ├── seoul_ingu_index_create.sh
│   └── seoul_pop.txt
├── nginx_vfs
│   ├── default.conf
│   ├── seoul_adm.geojson
├── python_vfs
│   ├── python_es.py
│   ├── seoul_wifi_index_create.sh
│   ├── wifi_api.py
│   ├── wifi_app.py
│   └── wifi_bulk.py
└── docker-compose.yml
``` 

<br>

## DataFlow
![Github_Logo](/static/data_analytics_flow.jpeg)

<br>

## 1. Flow A1
---
<br>

#### 1) 서울 열린데이터 - 서울시 주민등록인구 통계 다운로드
* 링크 : https://data.seoul.go.kr/dataList/10043/S/2/datasetView.do
* 파일 : [seoul_pop.txt](/logstash_vfs/seoul_pop.txt)

#### 2) 로그스태시 파이프라인 작성
* 파일 : [logstash-spop.conf](/logstash_vfs/logstash-spop.conf)

#### 3) seoul_ingu 인덱스 매핑 생성
* 파일 : [seoul_ingu_index_create.sh](/logstash_vfs/seoul_ingu_index_create.sh)

#### 4) 로그스태시 파이프라인 실행
```
./bin/logstash -f ./config/logstash-spop.conf
```

<br>

## 2. Flow A2
---
<br>

#### 1) 국가공간정보포털 - 행정동 경계 지리 정보 다운로드
* 링크 : http://data.nsdi.go.kr/dataset/20171206ds00001
* 파일 : Z_SOP_BND_ADM_DONG_PG.zip

#### 2) QGIS 이용하여 GeoJSON 파일 변환
* 링크 : https://qgis.org/ko/site/forusers/download.html
    * 한글 인코딩 깨짐 문제 해결방법
        * QGIS에서 레이어 마우스 우클릭 -> 속성 -> 데이터원본인코딩 EUC-KR로 변경

#### 3) NginX 웹서버 설정 파일 작성
* 파일 : [default.conf](/nginx_vfs/default.conf)

#### 4) NginX 웹서버 실행 및 파일 업로드
* 파일 : [seoul_adm.geojson](/nginx_vfs/seoul_adm.geojson)

#### 5) 키바나 설정 파일 작성
* 파일 : [kibana.yml](/kibana_vfs/kibana.yml)

#### 6) 키바나 분석 시각화
* 링크 : http://localhost:5601
  * 서울에서 일인 가구가 많은 지역은 어디일까?
  * 서울에서 외국인이 많은 곳은 어디일까?

<br>

## 3. Flow B
---
<br>

#### 1) 서울 열린데이터 - 공공 와이파이 오픈 API 키 발급
* 링크 : http://data.seoul.go.kr/dataList/OA-20883/S/1/datasetView.do

#### 2) 파이썬 수집기 개발
* 오픈 API 데이터 수집
    * 파일 : [wifi_api.py](/python_vfs/wifi_api.py)
* 엘라스틱서치 저장 및 검색
    * 파일 : [python_es.py](/python_vfs/python_es.py)
* 파이썬 클라이언트앱
    * 파일 : [wifi_app.py](/python_vfs/wifi_app.py)
* 파이썬 클라이언트앱 (ver.bulk)
    * 파일 : [wifi_bulk.py](/python_vfs/wifi_bulk.py)

#### 3) seoul_wifi 인덱스 매핑 생성
* 파일 : [seoul_wifi_index_create.sh](/python_vfs/seoul_wifi_index_create.sh)

#### 4) 파이썬 클라이언트앱 실행
```
python /app/wifi_app.py
```

#### 3) 키바나 분석 시각화
* 링크 : http://localhost:5601
  * 서울시 공공와이파이 위치 시각화하기