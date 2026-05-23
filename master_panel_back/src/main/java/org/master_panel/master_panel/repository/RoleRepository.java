package org.master_panel.master_panel.repository;

import org.master_panel.master_panel.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Role findByName(String name);

}