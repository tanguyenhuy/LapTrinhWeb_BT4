package huytan.vn.services;

import java.util.List;
import huytan.vn.entities.Product;

public interface IProductService {
    void insert(Product product);
    void update(Product product);
    void delete(int id);
    Product findById(int id);
    List<Product> findAll();
    List<Product> findAll(int page, int pageSize);
    List<Product> findTop10Newest();
    int count();
}