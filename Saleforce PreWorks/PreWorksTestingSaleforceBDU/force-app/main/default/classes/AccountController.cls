public with sharing class AccountController {
  @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(string searchKey) {
      return [SELECT Id,Name,Phone,Industry, website
              FROM Account
              WHERE Name LIKE: '%' + searchKey + '%'];
    }
  }