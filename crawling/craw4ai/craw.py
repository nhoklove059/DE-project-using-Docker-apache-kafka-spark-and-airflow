from craw4ai import *

class TheGioiDiDongSpider():
    name = "F1"
    start_urls = ["https://www.formula1.com/en/results/2024/drivers"]

    # Use CSS selectors or XPath to extract the desired data
    rules = [
        {
            "item": {
                "laptop_name": {
                    "css": ".item-name",
                    "type": "string",
                },
                "rating": {
                    "css": ".item-rating span",
                    "type": "string",
                },
                "comments": {
                    "css": ".user-comment p",
                    "type": "list",
                },
            }
        }
    ]

    def parse_item(self, response, item):
        # Process the extracted data if needed
        return item
