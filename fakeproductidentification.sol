// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {
    struct Product {
        string name;
        string manufacturer;
        bool exists;
    }

    mapping(string => Product) private products;

    // Register a new product
    function registerProduct(string memory productId, string memory name, string memory manufacturer) public {
        require(!products[productId].exists, "Product ID already exists.");
        products[productId] = Product(name, manufacturer, true);
    }

    // Verify a product
    function verifyProduct(string memory productId) public view returns (string memory name, string memory manufacturer, bool exists) {
        Product memory product = products[productId];
        return (product.name, product.manufacturer, product.exists);
    }
} 