require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :db

def initialize(id:,name:,type:,db:@db)
@id = id
@name = name
@type = type
@db = db
end

def self.save(name,type,db)
sql = "INSERT INTO pokemon(name,type) VALUES (?,?)"
db.execute(sql,name,type)
end 

def self.find(id,db)
sql = "SELECT *
FROM pokemon
WHERE id = ?"

pokemon = db.execute(sql,id).flatten
name = pokemon[1]
type = pokemon[2]
pokemon_obj = Pokemon.new(id:id, name:name, type:type, db:db)
end 


end 