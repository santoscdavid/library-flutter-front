import 'package:flutter_modular/flutter_modular.dart';
import 'package:library_flutter/app/utils/custom_snackbars.dart';
import 'package:library_flutter/app/utils/global_scaffold.dart';
import 'package:library_flutter/data/repository/RentRepository/rent_repository.dart';
import 'package:library_flutter/domain/models/Rent/rent.dart';
import 'package:mobx/mobx.dart';

part 'rent_controller.g.dart';

class RentController = RentControllerBase with _$RentController;

abstract class RentControllerBase with Store {
  final RentRepository repository;

  RentControllerBase(this.repository) {
    getAllRents();
  }

  @observable
  bool isLoading = false;

  @observable
  List<Rent> rents = [];

  @observable
  List<Rent> cachedRents = [];

  filter(String value) async {
    isLoading = true;
    if (value.isEmpty) {
      rents = cachedRents;
    }

    List<Rent> list = rents
        .where(
          (e) =>
              e.id.toString().toLowerCase().contains(
                    value.toString(),
                  ) ||
              e.book!.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.customer!.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.rentStart.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              e.rentEnd.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              e.devolution.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  ),
        )
        .toList();

    rents = list;
    isLoading = false;
  }

  @action
  getAllRents() async {
    isLoading = true;

    try {
      rents = await repository.getAll();
      cachedRents = rents;

      isLoading = false;
    } catch (e) {
      CustomSnackBar().error('Houve um problema ao listar alugueis');
    }
  }

  @action
  createRent(Rent rent) async {
    try {
      rent.rentStart = DateTime.parse(
        rent.rentStart.toString(),
      ).toIso8601String();
      rent.rentEnd = DateTime.parse(
        rent.rentEnd.toString(),
      ).toIso8601String();

      await repository.post(rent).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Aluguel cadastrado com sucesso!'),
            ),
          );
      Modular.to.navigate('/rents/');
    } catch (err) {
      showSnackbar(
        CustomSnackBar().error('Erro ao tentar cadastrar aluguel'),
      );
    } finally {
      await getAllRents();
    }
  }

  @action
  updateRent(Rent rent) async {
    try {
      rent.rentStart = DateTime.parse(
        rent.rentStart.toString(),
      ).toIso8601String();
      rent.rentEnd = DateTime.parse(
        rent.rentEnd.toString(),
      ).toIso8601String();
      await repository.put(rent).then(
            (res) => showSnackbar(
              CustomSnackBar().success('Aluguel editado com sucesso!'),
            ),
          );
      Modular.to.navigate('/rents/');
    } catch (err) {
      showSnackbar(
        CustomSnackBar().error('Erro ao tentar editar aluguel'),
      );
    } finally {
      await getAllRents();
    }
  }

  @action
  completeRent(Rent rent) async {
    try {
      rent.devolution = DateTime.now().toIso8601String();
      await repository.put(rent).then(
            (res) => {
              if (res.statusCode != 201)
                showSnackbar(
                  CustomSnackBar().error('Erro ao tentar finalizar aluguel!'),
                )
              else
                {
                  showSnackbar(
                    CustomSnackBar().success('Aluguel finalizado com sucesso!'),
                  )
                }
            },
          );
    } catch (err) {
      showSnackbar(
        CustomSnackBar().error('Erro ao tentar finalizar aluguel'),
      );
    } finally {
      await getAllRents();
    }
  }

  @action
  deleteRent(Rent rent) async {
    {
      try {
        await repository.delete(rent).then(
              (res) => {
                showSnackbar(
                  CustomSnackBar().success('Aluguel apagado com sucesso!'),
                ),
                Modular.to.pop()
              },
            );
      } catch (err) {
        showSnackbar(
          CustomSnackBar().error('Erro ao tentar apagar o aluguel'),
        );
      } finally {
        await getAllRents();
      }
    }
  }
}
