import requests
from bs4 import BeautifulSoup

# URLs to scrape
urls = [
    "https://www.thegioididong.com/dtdd",
    "https://www.thegioididong.com/laptop"
]

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
}

def scrape_comments(url):
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, "html.parser")
        
        # Example structure: Find comment sections and ratings (adjust selectors based on the page structure)
        products = soup.select(".item a[href]")
        for product in products:
            product_name = product.get_text(strip=True)
            product_url = product["href"]

            # Fetch individual product's page
            product_response = requests.get(f"https://www.thegioididong.com{product_url}")
            product_soup = BeautifulSoup(product_response.text, "html.parser")
            
            # Extract ratings and comments
            comments = product_soup.select(".comment-item .cmt-txt")
            ratings = product_soup.select(".comment-item .rating-result")

            for cmt, rating in zip(comments, ratings):
                print({
                    "Product": product_name,
                    "Comment": cmt.get_text(strip=True),
                    "Rating": rating.get_text(strip=True)
                })
    else:
        print(f"Failed to access {url}")

# Loop through all URLs
for url in urls:
    scrape_comments(url)
