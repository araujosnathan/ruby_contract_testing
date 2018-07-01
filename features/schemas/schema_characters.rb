class SchemaCharacters 
  def initialize()
    items = {
      "type" => "array",
      "items" => [{
          "type" => "object",
          "required" => ["resourceURI", "name"],
          "properties" => {
              "resourceURI": {"type" => "string"},
              "name": {"type" => "string"},
              "type": {"type" => "string"}
          }
      }]
    }

    object_commom = {
      "type" => "object",
      "required" => ["available", "returned", "collectionURI", "items"],
      "properties" => {
          "available": {"type" => "integer"},
          "returned": {"type" => "integer"},
          "collectionURI": {"type" => "string"},
          "items": items
      }
    }
    thumbnail = {
      "type" => "object",
      "required" => ["path", "extension"],
      "properties" => {
          "path": {"type" => "string"},
          "extension": {"type" => "string"}
          }
    }

    urls = {
      "type" => "array",
      "items" => [{
          "type" => "object",
          "required" => ["type", "url"],
          "properties" => {
              "type": {"type" => "string"},
              "url": {"type" => "string"}
          }
      }]
    }

    results = {
      "type" => "array",
      "items" => [{
          "type" => "object",
          "required" => ["id", "name", "description", "modified", "resourceURI", "urls", "thumbnail", "comics", "stories", "events", "series"],
          "properties" => {
              "id": {"type" => "integer"},
              "name": {"type" => "string"},
              "description": {"type" => "string"},
              "modified": {"type" => "date-time"},
              "resourceURI": {"type" => "string"},
              "urls": urls,
              "thumbnail": thumbnail,
              "comics": object_commom,
              "stories": object_commom,
              "events": object_commom,
              "series": object_commom
      }
      }]
    }

    
    items_creators = {
      "type" => "array",
      "items" => [{
        "type" => "object",
        "required" => ["resourceURI", "name"],
        "properties" => {
            "resourceURI": {"type" => "string"},
            "name": {"type" => "string"},
            "role": {"type" => "string"}
        }
      }]
    }
    creators = {
      "type" => "object",
      "required" => ["available", "collectionURI", "items"],
      "properties" => {
          "available": {"type" => "integer"},
          "returned": {"type" => "integer"},
          "collectionURI": {"type" => "string"},
          "items": items_creators
      }
    }
    series = {
      "type" => "object",
      "required" => ["resourceURI", "name"],
      "properties" => {
          "resourceURI": {"type" => "string"},
          "name": {"type" => "string"}
      }
    }

    images = {
      "type" => "array",
      "items" => [{
        "type" => "object",
        "required" => ["path", "extension"],
        "properties" => {
            "path": {"type" => "string"},
            "extension": {"type" => "string"}
        }
      }]
    }
    prices = {
      "type" => "array",
      "items" => [{
        "type" => "object",
        "required" => ["type", "price"],
        "properties" => {
            "type": {"type" => "string"},
            "price": {"type" => "number"}
        }
      }]
    }

    dates = {
      "type" => "array",
      "items" => [{
        "type" => "object",
        "required" => ["type", "date"],
        "properties" => {
            "type": {"type" => "string"},
            "date": {"type" => "date-time"}
        }
      }]
    }

    object_commom_commics = {
      "type" => "array",
      "items" => [{
        "type" => "object",
        "required" => ["resourceURI", "name"],
        "properties" => {
            "resourceURI": {"type" => "string"},
            "name": {"type" => "integer"}
        }
      }]
    }

    textObjects = {
      "type" => "array",
      "items" => [{
          "type" => "object",
          "required" => ["type", "language", "text"],
          "properties" => {
              "type": {"type" => "string"},
              "language": {"type" => "string"},
              "text": {"type" => "string"}
       }
      }]
    }
    results_comics = {
      "type" => "array",
      "items" => [{
          "type" => "object",
          "required" => [
            "id", 
            "digitalId", 
            "title" , 
            "issueNumber",
            "variantDescription",
            "description", 
            "modified",
            "isbn", 
            "upc",
            "diamondCode",
            "ean",
            "issn",
            "format",
            "pageCount",
            "textObjects",
            "resourceURI",
            "urls",
            "series",
            "dates",
            "prices",
            "variants",
            "collections",
            "collectedIssues",
            "thumbnail",
            "images",
            "creators",
            "characters",
            "stories",
            "events"
          ],
          "properties" => {
              "id": {"type" => "integer"},
              "digitalId": {"type" => "integer"},
              "title": {"type" => "string"},
              "issueNumber": {"type" => "number"},
              "variantDescription": {"type" => "string"},
              "description": {"type" => "string"},
              "modified": {"type" => "date-time"},
              "isbn": {"type" => "string"},
              "upc": {"type" => "string"},
              "diamondCode": {"type" => "string"},
              "ean": {"type" => "string"},
              "issn": {"type" => "string"},
              "format": {"type" => "string"},
              "pageCount": {"type" => "integer"},
              "textObjects": textObjects,
              "resourceURI": {"type" => "string"},
              "urls": urls,
              "series": series,
              "variants": textObjects,
              "collections": object_commom_commics,
              "collectedIssues": object_commom_commics,
              "dates": dates,
              "prices": prices,
              "thumbnail": thumbnail,
              "images": images,
              "creators": creators,
              "characters": creators,
              "stories": creators,
              "events": creators,
      }
      }]
    }
    
    data = {
      "type" => "object",
      "required" => ["offset","limit","total","count", "results"],
      "properties" => {
          "offset"  => {"type" => "integer"},
          "limit" => {"type" => "integer"},
          "total" => {"type" => "integer"},
          "count" => {"type" => "integer"},
          "results" => results
      }
    }

    data_comics = {
      "type" => "object",
      "required" => ["offset","limit","total","count", "results"],
      "properties" => {
          "offset"  => {"type" => "integer"},
          "limit" => {"type" => "integer"},
          "total" => {"type" => "integer"},
          "count" => {"type" => "integer"},
          "results" => results_comics
      }
    }

    @schema_list_characters = {
      "type" => "object",
      "required" => ["code", "status","copyright", "attributionText", "attributionHTML", "etag", "data"],
      "properties" => {
          "code" => {"type" => "integer"},
          "status" => {"type" => "string"},
          "copyright" => {"type" => "string"},
          "attributionText" => {"type" => "string"},
          "attributionHTML" => {"type" => "string"},
          "etag" => {"type" => "string"},
          "data" => data
      }
    }

    @schema_comics_characters = {
      "type" => "object",
      "required" => ["code", "status","copyright", "attributionText", "attributionHTML", "etag", "data"],
      "properties" => {
          "code" => {"type" => "integer"},
          "status" => {"type" => "string"},
          "copyright" => {"type" => "string"},
          "attributionText" => {"type" => "string"},
          "attributionHTML" => {"type" => "string"},
          "etag" => {"type" => "string"},
          "data" => data_comics
      }
    }

    def get_list_characters()
      @schema_list_characters
    end

    def get_comics_characters()
      @schema_comics_characters
    end
  end
end
