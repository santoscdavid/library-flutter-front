import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/utils/custom_snackbars.dart';
import 'package:library_flutter/app/utils/global_scaffold.dart';
import 'package:library_flutter/data/repository/CustomerRepository/customer_repository.dart';
import 'package:library_flutter/domain/models/Customer/customer.dart';
import 'package:mobx/mobx.dart';

part 'customer_controller.g.dart';

class CustomerController = CustomerControllerBase with _$CustomerController;

abstract class CustomerControllerBase with Store {
  final CustomerRepository repository;

  CustomerControllerBase(this.repository) {
    getAllCustomers();
  }

  @observable
  bool isLoading = false;

  @observable
  List<Customer> customers = [];

  @observable
  List<Customer> cachedCustomers = [];

  @action
  getAllCustomers() async {
    isLoading = true;

    try {
      customers = await repository.getAll();
      cachedCustomers = customers;

      isLoading = false;
    } catch (e) {
      showSnackbar(
        CustomSnackBar().error('Houve um problema ao listar os clientes'),
      );
    }
  }

  @action
  filter(String value) async {
    isLoading = true;
    if (value.isEmpty) {
      customers = cachedCustomers;
    }

    List<Customer> list = customers
        .where(
          (e) =>
              e.id.toString().toLowerCase().contains(
                    value.toString(),
                  ) ||
              e.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.email.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.address.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.city.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ),
        )
        .toList();

    customers = list;
    isLoading = false;
  }

  @action
  createCustomer(Customer customer) async {
    try {
      await repository
          .post(customer)
          .then(
            (res) => showSnackbar(
              CustomSnackBar().success('Cliente cadastrado com sucesso!'),
            ),
          )
          .catchError(
            (err) => {
              showSnackbar(
                CustomSnackBar().error('Erro ao tentar cadastrado do cliente'),
              ),
            },
          );
      Modular.to.navigate('/customers/');
    } catch (err) {
      showSnackbar(
        CustomSnackBar().error('Erro ao tentar cadastrado do cliente'),
      );
    } finally {
      await getAllCustomers();
    }
  }

  @action
  updateCustomer(Customer customer) async {
    try {
      await repository.put(customer).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Cliente editada com sucesso!'),
            ),
          );
      Modular.to.navigate('/customers/');
    } catch (err) {
      showSnackbar(
        CustomSnackBar().error('Erro ao tentar editar o cliente'),
      );
    } finally {
      await getAllCustomers();
    }
  }

  @action
  deleteCustomer(Customer customer) async {
    {
      try {
        await repository.delete(customer).then((res) => {
              if (res.statusCode != 200)
                {
                  showSnackbar(
                    CustomSnackBar().error('Erro ao tentar apagar o Cliente'),
                  ),
                }
              else
                {
                  showSnackbar(
                    CustomSnackBar().success('Cliente apagado com sucesso!'),
                  ),
                  Modular.to.pop()
                }
            });
      } catch (err) {
        showSnackbar(
          CustomSnackBar().error('Erro ao tentar apagar o Cliente'),
        );
      } finally {
        await getAllCustomers();
      }
    }
  }
}
