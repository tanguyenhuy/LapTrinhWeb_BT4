package huytan.vn.services;

import java.util.List;
import huytan.vn.entities.Category;

public interface ICategoryService {
    void insert(Category category);
    void update(Category category);
    void delete(int cateid);
    Category findById(int cateid);
    Category findByCategoryname(String name);
    List<Category> findAll();
    List<Category> findAll(int page, int pagesize);
    List<Category> searchByName(String keyword);
    int count();
}