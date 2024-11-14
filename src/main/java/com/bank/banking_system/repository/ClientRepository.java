package com.bank.banking_system.repository;

import com.bank.banking_system.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {
    boolean existsByIdNumber(String idNumber);
    boolean existsByEmail(String email);
}
