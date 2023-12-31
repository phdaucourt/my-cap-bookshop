using {
    Currency,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {
    key ID       : Integer;
        title    : localized String(111);
        descr    : localized String(1111);
        author   : Association to Authors;
        genre    : Association to Genres;
        stock    : Integer;
        price    : Decimal(9, 2);
        currency : Currency
}

entity Authors : managed {
    key ID           : Integer;
        name         : String(111);
        dateOfBirth  : Date;
        dateOfDeath  : Date;
        placeOfBirth : String;
        placeOfDeath : String;
        books        : Association to many Books
                           on books.author = $self;
}

entity Genres : CodeList {
    key ID       : Integer;
        parent   : Association to Genres;
        children : Association to many Genres
                       on children.parent = $self;
}
