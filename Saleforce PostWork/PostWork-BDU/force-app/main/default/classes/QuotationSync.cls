public interface QuotationSync {

        boolean confirmProductExistByCode(String code);

        Integer searchProductByCode(String code);

}