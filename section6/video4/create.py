import requests
import random

names = [
   "chris", 
   "george", 
   "debbie", 
   "brendan", 
   "melisha", 
   "melissa", 
   "leigh", 
   "sarah", 
   "sari", 
   "avi", 
   "sri", 
   "kumar", 
   ]
descriptions = [
   'tall',
   'short',
   'wide',
   'green',
   'orange',
   'skinny',
   'fit',
   'old',
   'young',
   'grey',
   'happy',
]

for x in range(0,1000):    
    name = random.choice(names)
    description = random.choice(descriptions)
    resp = requests.put("http://localhost:5000/api/user/{}".format(x), json={"description": description, "name": name})
    print resp.text


