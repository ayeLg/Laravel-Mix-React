import axios from "axios";
import React, { useEffect, useState } from "react";
import Spinner from "../Component/Spinner";

export default function Home() {
    const [loader, setLoader] = useState(true);

    const [category, setCategory] = useState([]);
    const [productByCategory, setProductByCategory] = useState([]);
    const [featureProduct, setFeatureProduct] = useState([]);

    const fetchProduct = () => {
        axios.get("/api/home").then((d) => {
            // console.log(d.data);
            const { category, featureProduct, productByCategory } = d.data.data;
            setCategory(category);
            setFeatureProduct(featureProduct);
            setProductByCategory(productByCategory);

            setLoader(false);
        });
    };

    useEffect(() => {
        console.log(window.locale);
        fetchProduct();
    });

    return (
        <React.Fragment>
            {loader && <Spinner />}

            {!loader && (
                <React.Fragment>
                    {/* category list */}

                    <div className="w-80 mt-5">
                        <div className="row mt-2">
                            {/* loop category */}
                            {category.map((d) => (
                                <div
                                    className="col-12 col-sm-12 col-md-3 col-lg-3 border"
                                    key={d.slug}
                                >
                                    <a
                                        href={`/product?category=${d.slug}`}
                                        className="text-dark"
                                    >
                                        <div className="d-flex justify-content-around align-items-center p-3">
                                            <img
                                                src={d.image_url}
                                                width={100}
                                                alt=""
                                            />
                                            <div className="text-center">
                                                <p className="fs-2">
                                                    {window.locale === "mm"
                                                        ? d.mm_name
                                                        : d.name}
                                                </p>
                                                <small>{d.product_count}</small>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            ))}
                        </div>
                    </div>
                    <div className="w-80 mt-5">
                        <div className="row">
                            <div className="col-12 col-sm-12 col-md-3 col-lg-3 ">
                                {featureProduct.map((d) => (
                                    <a href={`/product/${d.slug}`} key={d.slug}>
                                        <div className="border bg-warning p-5 text-center rounded">
                                            <img
                                                src={d.image_url}
                                                className="w-80 margin-auto  rounded"
                                                alt=""
                                            />
                                            <div className="mt-5">
                                                <h4 className="text-center mt-4 text-white">
                                                    {d.name}
                                                </h4>
                                                <span className="text badge badge-white">
                                                    {d.sale_price} ks
                                                </span>
                                                <span className="text badge badge-danger">
                                                    <strike>
                                                        {d.discount_price} ks
                                                    </strike>
                                                </span>
                                            </div>
                                        </div>
                                    </a>
                                ))}
                            </div>
                            <div className="col-12 col-sm-12 col-md-9 col-lg-9">
                                <div className="row">
                                    {/* products */}

                                    {productByCategory.map((d) => (
                                        <div
                                            className="col-12 col-sm-12 col-md-12 col-lg-12 mt-3 product"
                                            key={d.slug}
                                        >
                                            <div className="row">
                                                <div className="col-12">
                                                    <div className="d-flex justify-content-between align-items-center">
                                                        <b className="fs-1">
                                                            {d.name}
                                                        </b>
                                                        <a
                                                            href={`/product?category=${d.slug}`}
                                                            className="btn btn-warning"
                                                        >
                                                            View All
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="row">
                                                {/* loop product */}
                                                {d.product.map((d) => (
                                                    <div
                                                        className="col-12 col-md-4 text-center mt-2"
                                                        key={d.slug}
                                                    >
                                                        <a
                                                            href={`product/${d.slug}`}
                                                        >
                                                            <div className="card p-2">
                                                                <img
                                                                    src={
                                                                        d.image_url
                                                                    }
                                                                    alt=""
                                                                    className="w-100"
                                                                />
                                                                <b>{d.name}</b>
                                                                <div>
                                                                    <small className=" badge badge-danger">
                                                                        {" "}
                                                                        <strike>
                                                                            {
                                                                                d.discount_price
                                                                            }{" "}
                                                                            Ks
                                                                        </strike>{" "}
                                                                    </small>
                                                                    <small className="badge bg-primary">
                                                                        {
                                                                            d.sale_price
                                                                        }{" "}
                                                                        ks
                                                                    </small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div>
                </React.Fragment>
            )}
        </React.Fragment>
    );
}
