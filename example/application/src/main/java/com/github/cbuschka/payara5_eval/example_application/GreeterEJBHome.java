package com.github.cbuschka.payara5_eval.example_application;

import javax.ejb.EJBHome;
import java.rmi.RemoteException;

public interface GreeterEJBHome extends EJBHome {
    GreeterEJBObject create() throws RemoteException;
}
