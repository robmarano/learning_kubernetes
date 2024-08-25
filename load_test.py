import requests
import time

API_ENDPOINT = "http://192.168.49.2:30623/ping"
NUM_REQUESTS = 1000

for _ in range(NUM_REQUESTS):
    response = requests.get(API_ENDPOINT)
    #print('{} {}'.format(response.status_code, response.text))
    time.sleep(0.1)  # Adjust the delay to control request frequency