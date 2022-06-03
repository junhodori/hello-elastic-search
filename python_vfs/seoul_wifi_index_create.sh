curl -X PUT 'http://elasticsearch:9200/seoul_wifi' \
-H 'Content-Type: application/json' \
-d '{
  "settings": {
    "analysis": {
      "analyzer": {
        "korean": {
          "tokenizer": "nori_tokenizer"
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "gu_nm": {"type": "keyword"},
      "place_nm": {"type": "text", "analyzer": "korean"},
      "instl_xy": {"type": "geo_point"}
    }
  }
}'