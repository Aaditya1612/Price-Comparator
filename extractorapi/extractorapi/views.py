from django.http import JsonResponse
from extractorScripts import flipkart
from extractorScripts import snapdeal


def extract(request):
    PRODUCT_NAME = request.GET.get("pname", '')
    # EXTRACTS = dict()
    # EXTRACTS['flipkart'] = flipkart.init(PRODUCT_NAME)
    # EXTRACTS['snapdeal'] = snapdeal.init(PRODUCT_NAME)
    EXTRACTS = {
    "flipkart": {
        "title": "boAt Airdopes 131 PRO with 11mm Drivers,45Hrs Playback,ASAP Charge & Quad Mic ENx Bluetooth Headset",
        "price": "₹1,199",
        "ratings": "3.9",
        "del_cost": "Free delivery",
        "img": "https://rukminim2.flixcart.com/image/612/612/xif0q/headphone/f/o/t/-original-imagspfgch2pr2zy.jpeg?q=70"
    },
    "snapdeal": {
        "title": "boAt Airdopes 402 White Neckband Wireless With Mic Headphones/Earphones White",
        "price": "Rs. 5,990",
        "ratings": "4.0",
        "del_cost": "Free Delievery",
        "img": "https://n2.sdlcdn.com/imgs/k/d/0/230X258_sharpened/boAt-Airdopes-402-White-Neckband-SDL379150121-1-ce356.jpg"
    }
}
    return JsonResponse(EXTRACTS, safe=False)