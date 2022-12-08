import axios from "axios";
import React, { useEffect, useState } from "react";
import { Review } from "./Component/Review";
import Spiner from "../Component/Spinner";
import SmallSpinner from "../Component/SmallSpinner";

export default function ProductDetail() {
    const [product, setProduct] = useState({});
    const [loader, setLoader] = useState(true);
    const [cartLoader, SetCartLoader] = useState(false);
    const product_slug = window.product_slug;

    useEffect(() => {
        axios.get("/api/product/" + product_slug).then(({ data }) => {
            setProduct(data.data);
            setLoader(false);
        });
    }, []);

    // Add to Cart
    const addToCart = () => {
        SetCartLoader(true);
        if (!window.auth) {
            showToast("You aren't Login. Please Login First");
        } else {
            const user_id = window.auth.id;

            axios
                .post("/api/add-tocart/" + product_slug, { user_id })
                .then((d) => {
                    const { data } = d;

                    console.log(data);
                    if (data.false) {
                        SetCartLoader(false);
                        showToast("Product Not Found");
                    } else {
                        window.updateCart(data.data);
                        showToast("Product Added To Cart.");
                        SetCartLoader(false);
                    }
                });
        }
    };

    return (
        <div>
            {loader && <Spiner />}

            {!loader && (
                <div className="card p-4">
                    <div className="row">
                        <div className="col-12 mb-3">
                            <h3>{product.name}</h3>
                            <div>
                                <small className="text-muted">Brand:</small>
                                <small>{product.brand.name}</small>|
                                <small className="text-muted">Category:</small>
                                <small className="badge badge-dark">
                                    {product.category.name}
                                </small>
                            </div>
                        </div>
                        <div className="col-12 col-sm-12 col-md-4 col-lg-4">
                            <img
                                className="w-100"
                                src="assets/images/product2.jpeg"
                                alt=""
                            />
                        </div>
                        <div className="col-12 col-sm-12 col-md-8 col-lg-8">
                            <div className="mt-5">
                                <p>
                                    <small className="text-muted">
                                        <strike>
                                            {product.discount_price}ks
                                        </strike>
                                    </small>
                                    <span className="text-danger fs-1 d-inline">
                                        {product.sale_price}ks
                                    </span>
                                    <br />
                                    <span className="btn btn-sm btn-outline-success text-success mt-3">
                                        InStock : {product.total_quantity}
                                    </span>
                                    <button
                                        className="btn btn-sm btn-danger mt-3"
                                        onClick={() => addToCart()}
                                        disabled={cartLoader}
                                    >
                                        {cartLoader && (
                                            <>
                                                <SmallSpinner />
                                            </>
                                        )}
                                        <i className="fas fa-shopping-cart" />
                                        Add To Cart
                                    </button>
                                </p>
                                <p
                                    className="mt-5"
                                    dangerouslySetInnerHTML={{
                                        __html: product.description,
                                    }}
                                ></p>
                                <small className="text-muted">
                                    Available Color:
                                </small>
                                {product.color.map((d) => (
                                    <span
                                        className="badge badge-danger"
                                        key={d.id}
                                    >
                                        {d.name}
                                    </span>
                                ))}
                            </div>
                        </div>
                        <hr />
                        <Review review={product.review} />
                    </div>
                </div>
            )}
        </div>
    );
}
