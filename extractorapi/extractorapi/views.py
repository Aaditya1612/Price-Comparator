from django.http import JsonResponse
from extractorScripts import flipkart
from extractorScripts import snapdeal
from extractorScripts import poorvika
from extractorScripts import shopclues

def extract(request):
    PRODUCT_NAME = request.GET.get("pname", '')
    EXTRACTS = dict()
    #EXTRACTS['flipkart'] = flipkart.init(PRODUCT_NAME)
    EXTRACTS['shopclues'] = shopclues.init(PRODUCT_NAME)
    EXTRACTS['snapdeal'] = snapdeal.init(PRODUCT_NAME)
    EXTRACTS['poorvika'] = poorvika.init(PRODUCT_NAME)
    
    return JsonResponse(EXTRACTS, safe=False)