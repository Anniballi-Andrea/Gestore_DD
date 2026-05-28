package org.master_panel.master_panel.service;

import java.util.List;
import java.util.Optional;

import org.master_panel.master_panel.model.MagickItem;
import org.master_panel.master_panel.repository.MagickItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MagickItemsService {
    @Autowired
    private MagickItemRepository itemRepo;

    public List<MagickItem> getAll() {
        return itemRepo.findAllByOrderByNameDesc();
    }

    public List<MagickItem> getAll(String name) {

        if ((name == null || name.isBlank())) {

            return itemRepo.findAllByOrderByIdDesc();
        } else

            return itemRepo.findByNameContaining(name);

    }

    public MagickItem getById(Integer id) {
        Optional<MagickItem> item = itemRepo.findById(id);

        if (item.isEmpty()) {
            throw new RuntimeException("l'oggetto non è stato trovato");
        }
        return item.get();
    }

    public MagickItem create(MagickItem item) {
        return itemRepo.save(item);
    }

    public MagickItem update(MagickItem item) {
        return itemRepo.save(item);
    }

    public void delete(MagickItem item) {
        itemRepo.delete(item);
    }

    public void deleteById(Integer id) {
        MagickItem item = getById(id);

        itemRepo.delete(item);
    }
}
