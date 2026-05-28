package org.master_panel.master_panel.repository;

import java.util.List;

import org.master_panel.master_panel.model.MagickItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MagickItemRepository extends JpaRepository<MagickItem, Integer> {

    public List<MagickItem> findAllByOrderByIdDesc();

    public List<MagickItem> findAllByOrderByNameAsc();

    public List<MagickItem> findAllByOrderByNameDesc();

    public List<MagickItem> findByNameContaining(String name);

}