package huytan.vn.dao;
import huytan.vn.entities.User;

public interface IUserDao {
    void insert(User user);
    void update(User user);
    User findByUsername(String username);
    User findByEmail(String email);
    User findByUsernameOrEmail(String value);
}