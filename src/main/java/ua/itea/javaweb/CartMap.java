package ua.itea.javaweb;
import java.util.*;

public class CartMap {

    private Map<Integer, Integer> cartMap = new TreeMap<Integer, Integer>();

    public CartMap() {
    }

    public void setProduct(Integer productId, Integer qnt) {
        Integer currentQnt = cartMap.get(productId);
        cartMap.put(productId, currentQnt == null ? qnt : currentQnt + qnt);
    }

    public void changeProduct(Integer productId, Integer qnt) {
        cartMap.put(productId, qnt);
    }

    public void removeProduct(Integer productId) {
        cartMap.remove(productId);
    }

    public Map<Integer, Integer> getCartMap() {
        return cartMap;
    }

}