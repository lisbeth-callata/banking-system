package com.bank.banking_system.service;


import com.bank.banking_system.model.Account;
import com.bank.banking_system.model.Client;
import com.bank.banking_system.repository.AccountRepository;
import com.bank.banking_system.repository.ClientRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AccountService {

    private final AccountRepository accountRepository;
    private final ClientRepository clientRepository;

    public Account createAccount(Account account) {
        Long clientId = account.getClient().getId();
        Optional<Client> client = clientRepository.findById(clientId);

        if (client.isPresent()) {
            account.setClient(client.get());
            return accountRepository.save(account);
        } else {
            throw new IllegalArgumentException("Client ID not found.");
        }
    }

    public List<Account> getAllAccounts() {
        return accountRepository.findAll();
    }

    public Optional<Account> getAccountById(Long id) {
        return accountRepository.findById(id);
    }

    public Account deposit(Long accountId, Double amount) {
        Account account = accountRepository.findById(accountId).orElse(null);
        if (account != null) {
            account.setBalance(account.getBalance() + amount);
            return accountRepository.save(account);
        }
        return null;
    }

    public Account withdraw(Long accountId, Double amount) {
        Account account = accountRepository.findById(accountId).orElse(null);
        if (account != null && account.getBalance() >= amount) {
            account.setBalance(account.getBalance() - amount);
            return accountRepository.save(account);
        }
        return null;
    }
    public void deleteAccount(Long accountId) {
        accountRepository.deleteById(accountId);
    }
}
