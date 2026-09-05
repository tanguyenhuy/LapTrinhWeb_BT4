package huytan.vn.services;
import huytan.vn.entities.User;

public interface IUserService {
    boolean register(User user);
    boolean verifyOtp(String email, String otp);
    User login(String usernameOrEmail, String password);
    boolean sendForgotPasswordOtp(String email);
    boolean resetPassword(String email, String otp, String newPassword);
    User get(String usernameOrEmail);
    User findById(int id);
    void update(User user);
    void insert(User user);
}