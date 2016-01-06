class Address 
  include Neo4j::ActiveNode
  property :text, type: String
  property :lat, type: String
  property :long, type: String
end
