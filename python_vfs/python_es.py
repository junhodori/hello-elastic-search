from elasticsearch import Elasticsearch

es = Elasticsearch(['http://elasticsearch:9200'])

doc = {"name": "kim", "age": 35}
res = es.index(index='test_index', body=doc)
print(res)

doc = {
        "size": 1,
        "query": {
          "term": {
            "YEOJA_1": "3132"
          }
        }
      }

res = es.search(index='seoul_ingu', body=doc)
print(res)