
## `part_8`
1. Download the ready-made dashboard `Node Exporter Quickstart and Dashboard` from `Grafana Labs` official website. 
  > https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=dashboards
  - ![](../../misc/images/8.01.png)

  - ![](../../misc/images/8.03.png)

  - http://localhost:3000
  - скачиваем ![](../../misc/images/8.02.png)
  - добавляем тут http://localhost:3000/dashboard/import ![](../../misc/images/8.03.png)
  - пользуемся ![](../../misc/images/8.04.png)
2. Запустить ещё одну виртуальную машину, находящуюся в одной сети с текущей ![](../../misc/images/8.05.png)
3. Запустить тест нагрузки сети с помощью утилиты iperf3
    - sudo apt install iperf3
4. Посмотреть на нагрузку сетевого интерфейса
    - тест скорости![](../../misc/images/8.06.png)
    - результат в графане ![](../../misc/images/8.07.png)