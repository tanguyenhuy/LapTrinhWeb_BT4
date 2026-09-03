package huytan.vn.entities;

import java.io.Serializable;
import jakarta.persistence.*;

@Entity
@Table(name = "Users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "username", columnDefinition = "nvarchar(50) not null", unique = true)
    private String username;

    @Column(name = "email", columnDefinition = "nvarchar(150) not null", unique = true)
    private String email;

    @Column(name = "password", columnDefinition = "nvarchar(255) not null")
    private String password;

    @Column(name = "fullname", columnDefinition = "nvarchar(100) null")
    private String fullname;

    @Column(name = "avatar", columnDefinition = "nvarchar(500) null")
    private String avatar;

    @Column(name = "roleid")
    private int roleid; // 1: Admin, 2: Manager, 3: User

    @Column(name = "status")
    private int status; 

    @Column(name = "code", columnDefinition = "nvarchar(10) null")
    private String code; // lưu mã OTP

    public User() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }
    public int getRoleid() { return roleid; }
    public void setRoleid(int roleid) { this.roleid = roleid; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
}