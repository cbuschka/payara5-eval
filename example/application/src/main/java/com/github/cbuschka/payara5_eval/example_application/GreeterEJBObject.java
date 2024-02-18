package com.github.cbuschka.payara5_eval.example_application;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface GreeterEJBObject extends EJBObject {
    String getMessage() throws RemoteException;
}
