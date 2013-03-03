package com.wyq.jpa.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import com.wyq.jpa.model.Entry;

public interface EntryDao extends JpaRepository<Entry, Integer>,JpaSpecificationExecutor<Entry>{
}
