package org.master_panel.master_panel.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.master_panel.master_panel.model.Role;
import org.master_panel.master_panel.model.User;
import org.master_panel.master_panel.repository.RoleRepository;
import org.master_panel.master_panel.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepo;

    public List<User> getAll() {

        return userRepo.findAllByOrderByIdDesc();

    }

    public User getById(Integer id) {
        Optional<User> user = userRepo.findById(id);

        if (user.isEmpty()) {
            throw new RuntimeException("l'utente non è stato trovato");
        }
        return user.get();
    }

    public User create(User user) {

        if (userRepo.existsByUsername(user.getUsername())) {
            throw new UsernameAlreadyExistException("Username già utilizzato");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Role defaultRole = roleRepo.findByName("USER");
        if (defaultRole == null) {
            Role newRole = new Role();
            newRole.setName("USER");
            defaultRole = roleRepo.save(newRole);

        }
        Set<Role> roles = new HashSet<>();
        roles.add(defaultRole);
        user.setRoles(roles);

        return userRepo.save(user);
    }

    public User promoteToAdmin(User user) {
        Role admin = roleRepo.findByName("ADMIN");
        Set<Role> roles = new HashSet<>();
        roles.add(admin);
        user.setRoles(roles);
        return userRepo.save(user);
    }

    @Transactional
    public User promoteToSpeller(User user) {
        Role speller = roleRepo.findByName("SPELLER");
        if (speller == null) {
            Role newRole = new Role();
            newRole.setName("SPELLER");
            speller = roleRepo.save(newRole);
        }
        Set<Role> roles = new HashSet<>();
        roles.add(speller);
        user.setRoles(roles);
        return userRepo.save(user);
    }

    public User demoteToUser(User user) {
        Role userRole = roleRepo.findByName("USER");
        Set<Role> roles = new HashSet<>();
        roles.add(userRole);
        user.setRoles(roles);
        return userRepo.save(user);

    }

    public User update(User user) {
        return userRepo.save(user);
    }

    public void delete(User user) {
        userRepo.delete(user);
    }

    public void deleteById(Integer id) {
        User user = getById(id);
        userRepo.delete(user);
    }

    public class UsernameAlreadyExistException extends RuntimeException {
        public UsernameAlreadyExistException(String message) {
            super(message);
        }
    }

}
