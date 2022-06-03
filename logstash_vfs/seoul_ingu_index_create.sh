curl -X PUT 'http://elasticsearch:9200/seoul_ingu' \
-H 'Content-Type: application/json' \
-d '{
  "mappings": {
    "properties": {
      "JACHIGU": {"type": "keyword"},
      "DONG": {"type": "keyword"},
      "SEDAE": {"type": "integer"},
      "GYE_1": {"type": "integer"},
      "NAMJA_1": {"type": "integer"},
      "YEOJA_1": {"type": "integer"},
      "GYE_2": {"type": "integer"},
      "NAMJA_2": {"type": "integer"},
      "YEOJA_2": {"type": "integer"},
      "GYE_3": {"type": "integer"},
      "NAMJA_3": {"type": "integer"},
      "YEOJA_3": {"type": "integer"},
      "SEDAEDANGINGU": {"type": "float"},
      "N_65SEISANGGORYEONGJA": {"type": "integer"}
    }
  }
}'