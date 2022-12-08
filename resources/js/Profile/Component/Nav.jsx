import React from "react";
import { Link, useLocation } from "react-router-dom";

const Nav = () => {
    const { pathname } = useLocation();

    return (
        <div>
            {" "}
            <div className="container-fluid mt-3">
                <div className="card p-3 bg-dark text-center">
                    <div>
                        <Link
                            to={"/"}
                            className={`btn btn${
                                pathname === "/" ? "" : "-outline"
                            }-warning`}
                        >
                            Cart List
                        </Link>
                        <Link
                            to={"/order"}
                            className={`btn btn${
                                pathname === "/order" ? "" : "-outline"
                            }-warning`}
                        >
                            Order List
                        </Link>
                        <Link
                            to={"/profile"}
                            className={`btn btn${
                                pathname === "/profile" ? "" : "-outline"
                            }-warning`}
                        >
                            Profile List
                        </Link>
                        <Link
                            to={"/password"}
                            className={`btn btn${
                                pathname === "/passoword" ? "" : "-outline"
                            }-warning`}
                        >
                            Change Password
                        </Link>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Nav;
