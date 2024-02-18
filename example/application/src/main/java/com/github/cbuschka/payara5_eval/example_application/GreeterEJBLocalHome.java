package com.github.cbuschka.payara5_eval.example_application;

import javax.ejb.EJBLocalHome;

public interface GreeterEJBLocalHome extends EJBLocalHome {
    GreeterEJBLocalObject create();
}
