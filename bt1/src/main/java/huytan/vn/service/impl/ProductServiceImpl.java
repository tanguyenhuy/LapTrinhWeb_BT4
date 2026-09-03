package huytan.vn.service.impl;

import java.util.List;
import huytan.vn.dao.IProductDao;
import huytan.vn.dao.impl.ProductDaoImpl;
import huytan.vn.entities.Product;
import huytan.vn.services.IProductService;

public class ProductServiceImpl implements IProductService {
    private IProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) { productDao.insert(product); }
    @Override
    public void update(Product product) { productDao.update(product); }
    @Override
    public void delete(int id) {
        try { productDao.delete(id); } catch (Exception e) { e.printStackTrace(); }
    }
    @Override
    public Product findById(int id) { return productDao.findById(id); }
    @Override
    public List<Product> findAll() { return productDao.findAll(); }
    @Override
    public List<Product> findAll(int page, int pageSize) { return productDao.findAll(page, pageSize); }
    @Override
    public List<Product> findTop10Newest() { return productDao.findTop10Newest(); }
    @Override
    public int count() { return productDao.count(); }
}