package huytan.vn.dao;

import java.util.List;
import huytan.vn.entities.Product;

public interface IProductDao {
    void insert(Product product);
    void update(Product product);
    void delete(int id) throws Exception;
    Product findById(int id);
    List<Product> findAll();
    List<Product> findAll(int page, int pageSize);
    List<Product> findTop10Newest();
    int count();
}