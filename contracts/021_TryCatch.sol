//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract errorContract{

    error customErrorMessage(string);

    /* Function returing require error */
    function requireError() public pure {
        require(false, "Require Error");
    }

    /* Function returing assert error */
    function assertError() public pure {
        assert(false);
    }

    /* Function returing custom error */
    function customError() public pure {
        revert("Custom Error generated");
    }

}

contract errorHandling{
    event eventRequireError(string errorReason);
    event eventAssertError(uint errCode);
    event eventCustomError(bytes lowLevelData);

    errorContract errContract = new errorContract();

    /* Function to catch the require error */
    function catchRequireError() public {
//      errContract.requireError();
        try errContract.requireError(){
            /* Executes if there is no error in the function */
        } catch Error (string memory errorReason){
            emit eventRequireError(errorReason);
        }
    }

    /* Function to catch the assert error */
    function catchAssertError() public {
//      errContract.assertError();
        try errContract.assertError(){
            /* Executes if there is no error in the function */
        } catch Panic (uint errCode){
            emit eventAssertError(errCode);
        }
    }

    /* Function to catch the custom error */
    function catchCustomError() public {
//      errContract.customError();
        try errContract.customError(){
            /* Executes if there is no error in the function */
        } catch (bytes memory lowLevelData){
            emit eventCustomError(lowLevelData);
        }
    }
}