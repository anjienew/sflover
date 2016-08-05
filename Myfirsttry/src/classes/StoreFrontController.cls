public class StoreFrontController {
    List<DisplayMerchandise> products;
    Map<Integer, DisplayMerchandise> shoppingCart = new Map<Integer, DisplayMerchandise>();
    
    public List<DisplayMerchandise> getProducts(){
        
        if(products == null){
            products = new List<DisplayMerchandise>();
            for(Merchandise__c item:[SELECT Name, Price__c, Quantity__c FROM Merchandise__c])
            products.add(new DisplayMerchandise(item));
        }
        return products;
    }
    
    public pageReference addToCart(){
        Integer addKey = 0;
        for(DisplayMerchandise p : products)
            if (p.qtyToBuy>0){
            shoppingCart.put(addKey,p);
            addKey++;
            }
        return null;
    }
    public String getCartContents(){
        if(shoppingCart.size() == 0)
            return '(empty)';
        String msg = '<ul>\n';
        for(Integer i=0;i<shoppingCart.size();i++){
            if(shoppingCart.get(i).qtyToBuy>0){
            msg+='<li>';
        	msg+=shoppingCart.get(i).name +' (' +shoppingCart.get(i).qtyToBuy + ')';
            msg+='<li>\n';
            }
        }
            
        /*for(DisplayMerchandise p:shoppingCart){
            msg+='<li>';
        	msg+=p.name +' (' +p.qtyToBuy + ')';
            msg+='<li>\n';}*/
        msg+='</ul>';
        return msg;
    }
    public class DisplayMerchandise{
        private Merchandise__c merchandise;
        public DisplayMerchandise(Merchandise__c item){
            this.merchandise = item;
        }
        public String name{
            get{return merchandise.Name;}
        }
        public Decimal price{
            get{return merchandise.Price__c;}
        }
        public Boolean inStock{
            get{return (merchandise.Quantity__c>0);}
        }
        public Integer qtyToBuy{get;set;}
    }

}