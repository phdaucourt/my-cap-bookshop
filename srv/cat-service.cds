using {sap.capire.bookshop as my} from '../db/schema';

service CatalogueService @(path: '/browse') {

    @readonly
    entity Books as
        select from my.Books {
            *,
            author.name as author
        }
        excluding {
            createdBy,
            modifiedBy
        };

    @requires: 'authenticated-users'
    action submitOrder(book: Books:ID, quantity: Integer);

}
