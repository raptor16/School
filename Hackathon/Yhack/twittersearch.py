from pymongo import MongoClient
import pprint

client = MongoClient ("mongodb://localhost:27017")
db = client.twitter

def tweetbynameandvacation()
	result = db.tweets.aggregate([
				{ "$group" : { "-id" : "$user.screen_name", 
								"_id" : {"entities.hashtags.vacation"}}}])
	return result

if __name__ == '__main__':
	result = tweetbynameandvacation()
	pprint.pprint(result)
	