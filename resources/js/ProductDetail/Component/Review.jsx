import { get } from "lodash";
import axios from "axios";
import React from "react";
import { useState } from "react";
import StarRating from "react-star-ratings";

export const Review = ({ review }) => {
    const [ratecount, setRatecount] = useState(0);
    const [getreview, setGetreview] = useState("");

    const user_id = window.auth.id;
    const product_slug = window.product_slug;
    const getRateCount = (rateCount) => {
        setRatecount(rateCount);
    };

    const reviewSubmit = (event) => {
        event.preventDefault();

        axios
            .post("/api/make-review?user_id=" + user_id, {
                ratecount,
                getreview,
                product_slug,
            })
            .then((d) => {
                const { data } = d;
                console.log(d);
                if (data.data === "Make Review Success") {
                    showToast("Make Review Success");
                } else {
                    showToast("Make Review Fail");
                }
            });
        window.location.reload(true);
    };
    return (
        <div>
            <div className="col-12" style={{ marginTop: "100px" }}>
                {/* loop review */}

                {review.map((d) => (
                    <div className="review" key={d.id}>
                        <div className="card p-3">
                            <div className="row">
                                <div className="col-md-2">
                                    <div className="d-flex justify-content-between">
                                        <img
                                            className="w-100 rounded-circle"
                                            src="assets/images/user.jpeg"
                                            alt=""
                                        />
                                    </div>
                                </div>
                                <div className="col-md-10">
                                    <div className="rating">
                                        <StarRating
                                            rating={d.rating}
                                            starRatedColor="#FB6340"
                                            numberOfStars={5}
                                            starDimension="20px"
                                            name="rating"
                                        />
                                    </div>
                                    <div className="name">
                                        <b>{d.user.name}</b>
                                    </div>
                                    <div className="mt-3">
                                        <small>{d.review}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                ))}

                {window.auth && (
                    <div className="add-review mt-5">
                        <h4>Make Review</h4>
                        {/* Rating Component */}
                        <StarRating
                            starHoverColor="#FB6340"
                            changeRating={(rateCount) =>
                                getRateCount(rateCount)
                            }
                            numberOfStars={5}
                        />

                        <div>
                            <form onSubmit={reviewSubmit}>
                                <textarea
                                    className="form-control"
                                    rows={5}
                                    placeholder="enter review"
                                    defaultValue={""}
                                    onChange={(e) =>
                                        setGetreview(e.target.value)
                                    }
                                />
                                <button className="btn btn-dark float-right mt-3">
                                    Review
                                </button>
                            </form>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
};
