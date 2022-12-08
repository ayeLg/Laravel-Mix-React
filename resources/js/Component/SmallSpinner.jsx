import React from "react";

const SmallSpinner = () => {
    return (
        <span>
            <div className="spinner-border spinner-border-sm" role="status">
                <span className="sr-only">Loading...</span>
            </div>
        </span>
    );
};

export default SmallSpinner;
