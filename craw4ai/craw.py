from craw4ai.spiders import BaseSpider

class TheGioiDiDongSpider(BaseSpider):
    name = "thegioididong_spider"
    start_urls = ["https://www.thegioididong.com/laptop"]

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
