import requests
import concurrent.futures

url = "http://localhost/home.php"
parameters = {
    'uname': 'admin',
    'password': 'S3curePassw0rd'
}

# Function to send the request
def send_request(url, parameters):
    response = requests.get(url, params=parameters)
    if response.status_code == 200:
        print("Request was successful.")
        print("Response Content:", response.text)
    else:
        print("Request failed with status code:", response.status_code)

# Number of parallel requests to send
num_requests = 100000  # Change this number to the desired number of simultaneous requests

# Create a ThreadPoolExecutor with max_workers as the number of requests
with concurrent.futures.ThreadPoolExecutor(max_workers=num_requests) as executor:
    # Submit the requests
    futures = [executor.submit(send_request, url, parameters) for _ in range(num_requests)]

    # Wait for all requests to complete
    for future in concurrent.futures.as_completed(futures):
        try:
            future.result()  # Get the result of each request
        except Exception as e:
            print("Request raised an exception:", e)
