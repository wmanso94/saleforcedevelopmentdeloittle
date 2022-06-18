public interface QuotationSync {

        boolean confirmProductExistByCode(String code);

        Double searchProductByCode(String code);

}